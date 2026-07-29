import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

/-!
# LU Decomposition Package
-/

structure LUDecompositionPackage {V : Type u} [AddCommGroup V] [Module ℝ V] where
  matrix : Matrix (Fin n) (Fin n) ℝ
  lowerTriangular : Matrix (Fin n) (Fin n) ℝ
  upperTriangular : Matrix (Fin n) (Fin n) ℝ
  luEquality : lowerTriangular * upperTriangular = matrix
  lowerTriangularUnit : Prop
  permutationApplied : Prop
  decompositionExists : Prop

structure LUDecompositionEvidence {V : Type u} [AddCommGroup V] [Module ℝ V] (L : LUDecompositionPackage V) where
  luEqualityClosed : L.luEquality
  lowerTriangularUnitClosed : L.lowerTriangularUnit
  permutationAppliedClosed : L.permutationApplied
  decompositionExistsClosed : L.decompositionExists

def LUDecompositionClosed {V : Type u} [AddCommGroup V] [Module ℝ V] (L : LUDecompositionPackage V) : Prop :=
  L.luEquality ∧ L.lowerTriangularUnit ∧ L.permutationApplied ∧ L.decompositionExists

theorem lu_decomposition_closed_from_evidence {V : Type u} [AddCommGroup V] [Module ℝ V]
    (L : LUDecompositionPackage V) (E : LUDecompositionEvidence L) : LUDecompositionClosed L :=
  And.intro E.luEqualityClosed (And.intro E.lowerTriangularUnitClosed (And.intro E.permutationAppliedClosed E.decompositionExistsClosed))

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse