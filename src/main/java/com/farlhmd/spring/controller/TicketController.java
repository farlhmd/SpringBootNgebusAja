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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.farlhmd.spring.model.Ticket;
import com.farlhmd.spring.model.TripSchedule;
import com.farlhmd.spring.model.User;
import com.farlhmd.spring.payload.request.TicketRequest;
import com.farlhmd.spring.payload.response.MessageResponse;
import com.farlhmd.spring.repository.TicketRepository;
import com.farlhmd.spring.repository.TripScheduleRepository;
import com.farlhmd.spring.repository.UserRepository;

import io.swagger.annotations.*;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/v1/ticket")
public class TicketController {

	@Autowired
	TicketRepository ticketRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	TripScheduleRepository tripScheduleRepository;

	@GetMapping("/")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getAll() {
		List<Ticket> dataArr=ticketRepository.findAll();
		return ResponseEntity.ok(new MessageResponse<Ticket>(true, "Success Retrieving Data", dataArr));
	}

	@GetMapping("/{id}")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasAnyRole('ADMIN','USER')")
	public ResponseEntity<?> getTicketById(@PathVariable(value = "id") Long id) {
		Ticket ticket = ticketRepository.findById(id).get();
			return ResponseEntity.ok(new MessageResponse<Ticket>(true, "Success Retrieving Data", ticket));
	}

	@PostMapping("/")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> addTicket(@Valid @RequestBody TicketRequest ticketRequest) {
		User user = userRepository.findById(ticketRequest.getPassegerId()).get();
		TripSchedule tripSchedule = tripScheduleRepository.findById(ticketRequest.getTripScheduleId()).get();
		Ticket ticket = new Ticket(ticketRequest.getSeatNumber(), ticketRequest.getCancellable(),
				ticketRequest.getJourneyDate(), user, tripSchedule);
		ticketRepository.save(ticket);
		return ResponseEntity
				.ok(new MessageResponse<Ticket>(true, "Success Adding Data", ticket));
	}
	
	@DeleteMapping("/{id}")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> deleteTicket(@PathVariable(value = "id") Long id) {
		String result = "";
		try {
			ticketRepository.findById(id).get();

			result = "Success Deleting Data with Id: " + id;
			ticketRepository.deleteById(id);

			return ResponseEntity.ok(new MessageResponse<Ticket>(true, result));
		} catch (Exception e) {
			result = "Data with Id: " + id + " Not Found";
			return ResponseEntity.ok(new MessageResponse<Ticket>(false, result));
		}
	}


}

