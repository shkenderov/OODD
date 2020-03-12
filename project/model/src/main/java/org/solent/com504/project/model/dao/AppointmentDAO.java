package org.solent.com504.project.model.dao;

import java.util.List;
import org.solent.com504.project.model.dto.Appointment;
import org.solent.com504.project.model.dto.Person;

/**
 *
 * @author Uchitelq
 * used to handle database request form serviceFacade using entityManager. 
 */
public interface AppointmentDAO {

     /**
     *
     * @param id of the appointment, is set when a appointment is saved
     * @return appointment found. 
     * @return null if no appointment is found.
     */
    public Appointment findById(Long id);
    /**
     *
     * @param appointment is the appointment to be added to the database.
     * @return the saved appointment with set id
     */
    public Appointment save(Appointment appointment);
    /**
     *
     * @return all appointments in the database as an array list.
     */
    public List<Appointment> findAll();
 /**
     *
     * @param appointment template person
     * @return true if appointment is found
     */
    public boolean delete(Appointment appointment);
    /**
     *
     * @param id - appointment id.
     * @return true if appointment found
     */
    public boolean deleteById(Long id);
    /**
     *Deletes all appointment entries in the database
     */
    public void deleteAll();


}
