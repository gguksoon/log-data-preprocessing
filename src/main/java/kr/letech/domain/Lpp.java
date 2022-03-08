package kr.letech.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.sun.istack.NotNull;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
public class Lpp {

	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.AUTO)
    private Long lppId;
	
	@NotNull
	private String filePath;
	
	@NotNull
	private String extrMethod;
	
	private String dbType;
	
	private String dbUrl;
	
	private String dbPort;
	
	private String dbName;
	
	private String dbUser;
	
	private String dbPass;
	
	private String tableName;
	
	@OneToMany(mappedBy = "lppId")
	private List<Regex> regex;
}
