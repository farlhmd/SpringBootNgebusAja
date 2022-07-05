package com.farlhmd.spring.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.farlhmd.spring.model.Trip;
import com.farlhmd.spring.model.TripSchedule;
import com.farlhmd.spring.payload.request.GetTripScheduleRequest;
import com.farlhmd.spring.payload.response.MessageResponse;
import com.farlhmd.spring.repository.TicketRepository;
import com.farlhmd.spring.repository.TripRepository;
import com.farlhmd.spring.repository.TripScheduleRepository;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/v1/trip_schedule")
public class TripScheduleController {
	
	@Autowired
	TripScheduleRepository tripScheduleRepository;

	@Autowired
	TicketRepository ticketRepository;

	@Autowired
	TripRepository tripRepository;

	@GetMapping("/")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasAnyRole('ADMIN','USER')")
	public ResponseEntity<?> getAll() {
		List<TripSchedule> dataArr = tripScheduleRepository.findAll();
		return ResponseEntity.ok(new MessageResponse<TripSchedule>(true, "Success Retrieving Data", dataArr));
	}
	
	@PostMapping("/")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> addTripSchedule(@Valid @RequestBody GetTripScheduleRequest tripScheduleRequest) {
		Trip trip = tripRepository.findById(tripScheduleRequest.getTrip_detail()).get();
		TripSchedule trip_schedule = new TripSchedule(tripScheduleRequest.getTripDate(),tripScheduleRequest.getAvailable_seats(), trip);
		return ResponseEntity
				.ok(new MessageResponse<TripSchedule>(true, "Success Adding Data", tripScheduleRepository.save(trip_schedule)));
	}

	@PutMapping("/{id}")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> updateTripSchedule(@PathVariable(value = "id") Long id,
			@Valid @RequestBody GetTripScheduleRequest trip_schedule_detail) {
		TripSchedule trip_schedule = tripScheduleRepository.findById(id).get();
		Trip trip = tripRepository.findById(trip_schedule_detail.getTrip_detail()).get();
		trip_schedule.setAvailableSeats(trip_schedule_detail.getAvailable_seats());
		trip_schedule.setTripDate(trip_schedule_detail.getTripDate());
		trip_schedule.setTripDetail(trip);

		TripSchedule updatedTripSchedule = tripScheduleRepository.save(trip_schedule);

		return ResponseEntity.ok(new MessageResponse<TripSchedule>(true, "Success Updating Data", updatedTripSchedule));
	}

	@DeleteMapping("/{id}")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> deleteTripSchedule(@PathVariable(value = "id") Long id) {
		String result = "";
		try {
			tripScheduleRepository.findById(id).get();

			result = "Success Deleting Data with Id: " + id;
			tripScheduleRepository.deleteById(id);

			return ResponseEntity.ok(new MessageResponse<TripSchedule>(true, result));
		} catch (Exception e) {
			result = "Data with Id: " + id + " Not Found";
			return ResponseEntity.ok(new MessageResponse<TripSchedule>(false, result));
		}
	}

}