package org.solent.com504.project.model.dao;

import java.util.List;
import org.solent.com504.project.model.dto.Person;
import org.solent.com504.project.model.dto.Role;

/**
 *
 * @author Uchitelq
 * used to handle database request form serviceFacade using entityManager. 
 */
public interface PersonDAO {

    /**
     *
     * @param id of the person, is set when a person is saved
     * @return Person found. 
     * @return null if no person is found.
     */
    public Person findById(Long id);

    /**
     *
     * @param person is the person to be added to the database.
     * @return the saved person with set id
     */
    public Person save(Person person);

    /**
     *
     * @return all people in the database as an array list.
     */
    public List<Person> findAll();

    /**
     *
     * @param id - person id.
     * @return true if person found
     */
    public boolean deleteById(long id);

    /**
     *
     * @param person template person
     * @return true if person is found
     */
    public boolean delete(Person person);

    /**
     *Deletes all Person entries in the database
     */
    public void deleteAll();

    /**
     * @return array list of the perople with the @param role
     */
    public List<Person> findByRole(Role role);

    /**
     *@return array list of the people with @param firstName @param secondName
     */
    public List<Person> findByName(String firstName, String secondName);
}
