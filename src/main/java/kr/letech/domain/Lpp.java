package kr.letech.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

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
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long lppId;
	
	@NotNull
	private String filePath;
	
	@ManyToOne
	@JoinColumn(name = "extrMethod")
	private Cd extrMethod;
	
	private String dbType;
	
	private String dbUrl;
	
	private String dbPort;
	
	private String dbName;
	
	private String dbUser;
	
	private String dbPass;
	
	private String tableName;
	
	@ManyToOne
	@JoinColumn(name = "status")
	private Cd status;
	
	private Date regDate;

	@OneToMany(mappedBy = "lppId")
	private List<Regex> regex;
	
	@PrePersist
	private void onCreate() {
		this.regDate = new Date();
		Cd cd = new Cd();
		cd.setCdId("CD0201");
		this.status = cd;
	}
}
