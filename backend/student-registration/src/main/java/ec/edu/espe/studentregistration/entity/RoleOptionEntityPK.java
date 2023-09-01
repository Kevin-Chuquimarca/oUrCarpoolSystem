package ec.edu.espe.studentregistration.entity;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.io.Serializable;
import java.util.Objects;

public class RoleOptionEntityPK implements Serializable {
    @Column(name = "id_op", nullable = false, length = 3)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String idOp;
    @Column(name = "id_rl", nullable = false, length = 3)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
        RoleOptionEntityPK that = (RoleOptionEntityPK) o;
        return Objects.equals(idOp, that.idOp) && Objects.equals(idRl, that.idRl);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOp, idRl);
    }
}
