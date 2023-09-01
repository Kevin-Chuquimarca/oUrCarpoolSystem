package ec.edu.espe.studentregistration.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "role_user", schema = "student_registration_db")
public class RoleUserEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_rl", nullable = false, length = 3)
    private String idRl;
    @Basic
    @Column(name = "name_rl", nullable = false, length = 20)
    private String nameRl;
    @Basic
    @Column(name = "description_rl", nullable = true, length = 100)
    private String descriptionRl;
}
