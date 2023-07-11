package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "role_option", schema = "student_registration_db")
@IdClass(RoleOptionEntityPK.class)
@NamedQueries({
        @NamedQuery(name = "RoleOptionEntity.findOptionByIdRl", query = "SELECT o FROM RoleOptionEntity r INNER JOIN OptionRoleEntity o ON r.idOp = o.idOp WHERE r.idRl = :idRl")
})
public class RoleOptionEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_op", nullable = false, length = 3)
    private String idOp;
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_rl", nullable = false, length = 3)
    private String idRl;

    public String getIdOp() {
        return idOp;
    }

    public void setIdOp(String idOp) {
        this.idOp = idOp;
    }

    public String getIdRl() {
        return idRl;
    }

    public void setIdRl(String idRl) {
        this.idRl = idRl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RoleOptionEntity that = (RoleOptionEntity) o;
        return Objects.equals(idOp, that.idOp) && Objects.equals(idRl, that.idRl);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOp, idRl);
    }
}
