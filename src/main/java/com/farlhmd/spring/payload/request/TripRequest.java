package com.farlhmd.spring.payload.request;

import javax.validation.constraints.NotBlank;

import com.sun.istack.NotNull;

import io.swagger.annotations.ApiModelProperty;

public class TripRequest {
	@ApiModelProperty(hidden = true)
	private Long id;

	private int fare;

	private int journeyTime;

	private Long sourceStopId;

	private Long destStopId;

	private Long busId;

	private Long agencyId;

	public TripRequest(Long id2, int fare2, int journeyTime2, Long id3, Long id4, Long id5, Long id6) {
		// TODO Auto-generated constructor stub
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getFare() {
		return fare;
	}

	public void setFare(int fare) {
		this.fare = fare;
	}

	public int getJourneyTime() {
		return journeyTime;
	}

	public void setJourneyTime(int journeyTime) {
		this.journeyTime = journeyTime;
	}

	public Long getSourceStopId() {
		return sourceStopId;
	}

	public void setSourceStopId(Long sourceStopId) {
		this.sourceStopId = sourceStopId;
	}

	public Long getDestStopId() {
		return destStopId;
	}

	public void setDestStopId(Long destStopId) {
		this.destStopId = destStopId;
	}

	public Long getBusId() {
		return busId;
	}

	public void setBusId(Long busId) {
		this.busId = busId;
	}

	public Long getAgencyId() {
		return agencyId;
	}

	public void setAgencyId(Long agencyId) {
		this.agencyId = agencyId;
	}

}
