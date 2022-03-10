package kr.letech.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.sun.istack.NotNull;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
public class Cd {

	@Id
	@NotNull
	private String cdId;
	
	@NotNull
	private String cdNm;
	
	private String upCdId;
	
}
