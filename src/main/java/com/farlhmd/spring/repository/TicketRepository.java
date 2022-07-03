package com.farlhmd.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.farlhmd.spring.model.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long> {

}
