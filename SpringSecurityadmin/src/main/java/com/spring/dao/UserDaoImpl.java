package com.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.spring.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {
	
	public void save(User user) {
		persist(user);
	}

	public User findById(int id) {
		return getByKey(id);
	}

	public User findBySSO(String sso) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("ssoId", sso));
		return (User) crit.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		Criteria crit = createEntityCriteria();
		//On peut rajouter des criteres
		//crit.add();
		return (List<User>) crit.list();
	}

	@Override
	public void updateUser(User user) {
		updateUser(user);

	}

	@Override
	public void removeUser(int id) {
		removeUser(id);

	}

}
