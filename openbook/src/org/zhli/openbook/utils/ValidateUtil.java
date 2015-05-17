package org.zhli.openbook.utils;

import java.util.Collection;

/**
 * 校验工具类
 */
public class ValidateUtil {

	/**
	 * @param src 
	 * 			待检验的字符串
	 * @return
	 * 			如果有效返回 true
	 */
	public static boolean isValidate(String src) {
		return !(src == null || "".equals(src.trim()));
	}
	
	/**
	 * 判断集合的有效性
	 * @param col 
	 * 			要判断的集合
	 * @return
	 * 			集合存在并且不为空返回 true
	 */
	public static boolean isValidate(Collection<?> col) {
		if(col == null || col.isEmpty())
			return false;
		return true;
	}
	
	/**
	 * 判断数组的有效性
	 * @param arr 
	 * 			要判断的数组
	 * @return
	 * 			数组存在并且不为空返回 true
	 */
	public static boolean isValidate(Object [] arr) {
		if(arr == null || arr.length == 0) {
			return false;
		}
		return true;
	}
	
	
}
