package kr.letech.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.sun.istack.NotNull;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
public class Regex {

	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long regexId;
	
	@NotNull
	private String regex;
	
	@NotNull
	private String columnName;
	
	@NotNull
	private Long lppId;
	
}
