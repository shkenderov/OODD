package org.solent.com504.project.model.service;

import java.util.List;
import org.solent.com504.project.model.dto.Appointment;
import org.solent.com504.project.model.dto.Person;
import org.solent.com504.project.model.dao.AppointmentDAO;
import org.solent.com504.project.model.dao.PersonDAO;
import org.solent.com504.project.model.dto.Role;

/**
 *
 * @author Uchitelq
 * Used from the JSP, the Facade's methods call the corresponding DAO methods
 * @see AppointmentDAO
 * @see PersonDAO
 */
public interface ServiceFacade {
    
    /**
     *
     * @return the time in a String format
     */
    public String getHeartbeat();
    
    /**
     *
     * @param name person id
     * @param site appointment id
     * @return true if successful
     * sets the PersonB attribute of the appointment to the person with the corresponding id.
     */
    public boolean personOnSite(String name, String site);
    
    /**
     *
     * @param name person id
     * @param site appointment id
     * @return true if successful
     * Changes the PersonB attribute of the appointment to null. Checks if that person's id is @param name
     */
    public boolean personLeavingSite(String name, String site);
    
    /**
     * calls the corresponding DAO method
     * @see PersonDAO 
     * @param id Person id
     * @return the found person
     * 
     */
    public Person findPersonById(Long id);

    /**
     * calls the corresponding DAO method
     * @see PersonDAO 
     * @param person person template to be saved
     * @return the saved person with person.id set
     */
    public Person savePerson(Person person);

    /**
     * calls the corresponding DAO method
     * @see PersonDAO
     * @return all people in the database as an array list.
     */
    public List<Person> findAllPerson();

    /**
     * calls the corresponding DAO method
     * @see PersonDAO
     * @param id person.id
     * @return true if successful
     */
    public boolean deletePersonById(long id);

    /**
     * calls the corresponding DAO method
     * @see PersonDAO
     * @param person person template
     * @return true if successful
     */
    public boolean deletePerson(Person person);

    /**
     * calls the corresponding DAO method
     * @see PersonDAO
     */
    public void deleteAllPerson();

    /**
     * calls the corresponding DAO method
     * @see PersonDAO
     * @param role finds by it
     * @return array list of all people with that role
     */
    public List<Person> findPersonByRole(Role role);

    /**
     * calls the corresponding DAO method
     * @see PersonDAO
     */
    public List<Person> findPersonByName(String firstName, String secondName);

    /**
     * calls the corresponding DAO method
     * @see AppointmentDAO
     */
    public Appointment findAppById(Long id);
     /**
     * calls the corresponding DAO method
     * @see AppointmentDAO
     */
    public Appointment saveApp(Appointment app);
     /**
     * calls the corresponding DAO method
     * @see AppointmentDAO
     */
    public List<Appointment> findAllApps();
     /**
     * calls the corresponding DAO method
     * @see AppointmentDAO
     */
    public boolean deleteApp(Appointment appointment);
 /**
     * calls the corresponding DAO method
     * @see AppointmentDAO
     */
    public boolean deleteAppById(Long id);
     /**
     * calls the corresponding DAO method
     * @see AppointmentDAO
     */
    public void deleteAllApps();
    
}
