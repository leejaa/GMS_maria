package com.gms.web.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;


public class ParamsIterator {
public static Map<?,?> execute(HttpServletRequest request){
	Map<String,String> result= new HashMap<>(); //리턴값이 맵이기 때문에 맵을 result라는 맵을 선언한다. 
	Map<String,String[]> map=request.getParameterMap(); //위의 result에 값을 넣어주기 위해 새로운 맵개체를 하나 더 선언해주는데 그 값은 request로 받아온 값이다.
	Set<Entry<String,String[]>> set=map.entrySet(); //entryset은 request로 받아온 값 이외의 다른값은 못들어오게 하는 울타리 같은 역할 이다.
	Iterator<Map.Entry<String,String[]>> it = set.iterator(); //이터레이터 객체는 반복적으로 찾아주는 역할을 한다.(중복값은 가져오지 않는다)
	String params[]=new String[set.size()];
	System.out.println("set size"+set.size());
	int i=0;
	while(it.hasNext()){ //hasNext()는 rs.next와 같이 it에 값이 있으면 true를 반환한다.
		Map.Entry<String, String[]> e = it.next(); //새로운 e라는 맵.엔트리 객체를 선언하여 거기에 it에 있는 값을 담는다.
		params[i]=e.getKey();	//params라는 스트링 배열에 e에 있는 키 값만 뽑아서 담아준다.
		i++;
	}
	for(i=0;i<params.length;i++){
		if(map.get(params[i]).length==1){
			result.put(params[i], map.get(params[i])[0]);
		
		}else{
			String temp="";
			for(int j=0;j<map.get(params[i]).length;j++){
				temp+=map.get(params[i])[j]+",";
			}
			result.put(params[i], temp);
		}
	}
	return result;
	}
	
}

