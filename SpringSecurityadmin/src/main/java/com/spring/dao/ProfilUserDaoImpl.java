package com.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.spring.model.ProfilUser;

@Repository( "userProfileDao" )
public class ProfilUserDaoImpl extends AbstractDao< Integer , ProfilUser > implements ProfilUserDao {

    @Override
    @SuppressWarnings( "unchecked" )
    public List< ProfilUser > findAll() {
        final Criteria crit = this.createEntityCriteria();
        crit.addOrder( Order.asc( "id" ) );
        return crit.list();
    }

    @Override
    public ProfilUser findById( final int id ) {
        return this.getByKey( id );
    }

    @Override
    public ProfilUser findByType( final String type ) {
        final Criteria crit = this.createEntityCriteria();
        crit.add( Restrictions.eq( "type", type ) );
        return (ProfilUser) crit.uniqueResult();
    }
}
