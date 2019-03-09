package serviceImpl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.stereotype.Service;

import mapper.BaicsMapper;
import service.Basic_Service;
import utils.SearchInfo;

@Service
public class Basic_ServiceImpl<T> implements Basic_Service<T> {
	BaicsMapper bm;

	private Method getMethod(String mname, Class... ts) throws Exception {
		Field mapperf = this.getClass().getDeclaredField("mapper");
		mapperf.setAccessible(true);
		bm = (BaicsMapper) mapperf.get(this);
		return bm.getClass().getMethod(mname, ts);
	}

	

	public List<T> select(SearchInfo info) {
		try {
			return (List<T>) getMethod("select", SearchInfo.class).invoke(bm, info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public T selectById(int id) {
		try {
			return (T) getMethod("selectById", int.class).invoke(bm, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void insert(T t) {
		try {
			getMethod("insert", t.getClass()).invoke(bm, t);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	public void update(T t) {
		try {
			getMethod("update", t.getClass()).invoke(bm, t);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateAll(T t) {
		try {
			getMethod("updateAll",  t.getClass()).invoke(bm, t);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(int id) {
		try {
			getMethod("delete", int.class).invoke(bm, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteALL(SearchInfo info) {
		try {
			getMethod("deleteALL", SearchInfo.class).invoke(bm, info);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int Maxid() {
		try {
			return (Integer) getMethod("Maxid").invoke(bm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}




}
