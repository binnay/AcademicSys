
package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name="registration")
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @NotBlank(message = "필수 입력 사항")
    @Size(max = 20, message = "과목명은 최대 20자까지 가능합니다")
    private String courseTitle;

    @Size(max = 10, message = "교과구분은 최대 10자까지 가능합니다")
    private String courseClassification;

    @NotBlank(message = "필수 입력 사항")
    @Size(max = 10, message = "교수님 성함은 최대 10자까지 가능합니다")
    private String professor;

    @Min(value = 0, message = "학점은 0 이상이어야 합니다")
    @Max(value = 5, message = "학점은 5 이하이어야 합니다")
    private int credits;

}
