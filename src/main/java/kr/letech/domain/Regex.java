package kr.letech.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;

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
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long regexId;
	
	@NotNull
	private String regex;
	
	@NotNull
	private String columnName;
	
	@NotNull
	private Long lppId;
	
}
