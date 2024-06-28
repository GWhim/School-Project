package com.ggg.bs.common;

import lombok.*;

/**
 * customResponse
 *   自定义的返回类
 * @author langjie
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CResponse {
	/** 返回代码 */
	private Integer code;
	/** 返回信息 */
	private String msg;
	/** 携带数据 */
	private Object Data;
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return Data;
	}

	public void setData(Object data) {
		Data = data;
	}

	/**
	 *  成功结果
	 * @param msg 返回信息
	 * @param data 返回数据
	 * @return CResponse对象
	 */
	public static CResponse SUCCESS(String msg,Object data){
		return new CResponse(200,msg,data);
	}
	
	/**
	 * 失败结果
	 * @param msg 返回信息
	 * @param data 返回数据
	 * @return CResponse对象
	 */
	public static CResponse FAIL(String msg,Object data) {
		return new CResponse(500,msg,data);
	}
}
