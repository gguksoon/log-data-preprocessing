package kr.letech.component;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

@Component
public class Pagination {

	public String getPagination(Page<?> page) {
		int index = page.getNumber() + 1; // 현재 페이지
		int total = page.getTotalPages(); // 최대 페이지
		int start = page.getNumber() / 10 * 10 + 1; // 페이지네이션 시작 페이지
		int end = start + 9 > total ? total : start + 9; // 페이지네이션 끝 페이지
		
		String str = "";
		
		if(start <= 1) {
			str += "<li class='page-item'><a class='page-link' href='#'	ng-click='fn_getPagingList(1)'><span aria-hidden='true'>&laquo;</span></a></li>";
		} else {
			str += "<li class='page-item'><a class='page-link' href='#'	ng-click='fn_getPagingList(" + (start - 10) + ")'><span aria-hidden='true'>&laquo;</span></a></li>";
		}
		
		for(int i = start; i <= end; i++) {
			if(i == index) {
				str += "<li class='page-item active'><a class='page-link' href='#'>" + i + "</a></li>";
			} else {
				str += "<li class='page-item'><a class='page-link' href='#' ng-click='fn_getPagingList(" + i + ")'>" + i + "</a></li>";
			}
			
		}
		
		if(index/10 == total/10) {
			str += "<li class='page-item'><a class='page-link' href='#'	ng-click='fn_getPagingList(" + total + ")'><span aria-hidden='true'>&raquo;</span></a></li>";
		} else {
			str += "<li class='page-item'><a class='page-link' href='#'	ng-click='fn_getPagingList(" + (end + 1) + ")'><span aria-hidden='true'>&raquo;</span></a></li>";
		}
		
		return str;
	}
}
