package service;

import dao.UserDao;
import dto.Task;
import dto.UserDto;
import helper.AES;

public class UserService {

	public boolean saveUser(UserDto dto) {
		if (dto.getAge() < 18)
			return false;
		else {
			UserDao dao = new UserDao();
			UserDto dto1 = dao.findByEmail(dto.getEmail());
			if (dto1 != null)
				return false;
			else {
				dto.setPassword(AES.encrypt(dto.getPassword(), "123"));
				dao.saveUser(dto);
				return true;
			}
		}
	}

	public boolean login(String email, String password) {
		UserDao dao = new UserDao();
		UserDto dto = dao.findByEmail(email);
		if (dto == null)
			return false;
		else {
			if (password.equals(AES.decrypt(dto.getPassword(), "123")))
				return true;
			else
				return false;
		}
	}

	public void saveTask(Task task) {
		UserDao dao = new UserDao();
		dao.saveTask(task);
	}

	public void updateUser(UserDto dto) {
		UserDao dao = new UserDao();
		dao.updateUser(dto);
	}
	public void changeStatus(int id)
	{
		UserDao dao=new UserDao();
		Task task=dao.findTaskById(id);
		task.setStatus(true);
		dao.updateTask(task);
	}

	public void deleteTask(int id, UserDto dto) {
		
		UserDao dao=new UserDao();
		Task task=dao.findTaskById(id);
		if(task!=null)
		{
			//removing mapping
			dto.getTasks().remove(task);
			dao.updateUser(dto);
			//delete task
			dao.deleteTask(task);
		}
	}
}
