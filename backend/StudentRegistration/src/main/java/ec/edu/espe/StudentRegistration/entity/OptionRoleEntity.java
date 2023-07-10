package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "option_role", schema = "student_registration_db")
public class OptionRoleEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_op", nullable = false, length = 3)
    private String idOp;
    @Basic
    @Column(name = "name_op", nullable = false, length = 20)
    private String nameOp;
    @Basic
    @Column(name = "description_op", nullable = true, length = 100)
    private String descriptionOp;
}
