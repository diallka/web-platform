package com.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.User;

@Repository( "userDao" )
public class UserDaoImpl extends AbstractDao< Integer , User > implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    //On déclare les methodes CRUD dans Abstract dao (on les reutilise ou redefinit ici)

    @Override
    public void save( final User user ) {
        this.persist( user );
    }

    @Override
    public User findById( final int id ) {
        return this.getByKey( id );
    }

    @Override
    public User findBySSO( final String sso ) {
        final Criteria crit = this.createEntityCriteria();
        crit.add( Restrictions.eq( "ssoId", sso ) );
        return (User) crit.uniqueResult();
    }

    @SuppressWarnings( "unchecked" )
    @Override
    public List< User > listUsers() {
        final Session session = this.sessionFactory.getCurrentSession();
        final List< User > result = session.createQuery( "from User" ).list();
        //On teste le retour en console
        for ( final User user : result ) {
            System.out.println( "Nom (" + user.getLastName() + ") : " + user.getAge() + " ans" );
        };
        //on renvoit le résultat
        return result;
    }

    @Override
    public void updateUser( final User user ) {
        this.update( user );
    }

    @Override
    public void removeUser( final int id ) {
        final Session session = this.sessionFactory.getCurrentSession();
        final User user = (User) session.load( User.class, new Integer( id ) );
        if ( null != user ) {
            this.delete( user );
        }

    }

    @SuppressWarnings( "unchecked" )
    @Override
    public List< User > count() {
        final Session session = this.sessionFactory.getCurrentSession();
        final List< User > result = session.createQuery( "select COUNT(id) from User" ).list();
        //On teste le retour en console
        System.out.println( result.get( 0 ) );
        //on renvoit le résultat
        return result;

    }

    //A voir
    /* try {
         int compteur = ( (Integer) session.iterate(
           "select count(*) from User").next() ).intValue();
         System.out.println("compteur = " + compteur);
       } finally {
         session.close();
       } */
    // Resultat type int : 3

}
