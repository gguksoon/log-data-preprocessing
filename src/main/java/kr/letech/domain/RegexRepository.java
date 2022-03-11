package kr.letech.domain;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RegexRepository extends JpaRepository<Regex, Long> {

	Long deleteByLppId(Long LppId); 
}
