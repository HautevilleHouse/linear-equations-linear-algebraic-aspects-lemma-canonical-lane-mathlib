import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure MatrixInvertibilityPackage (A : AdmissibleClass) where
  coefficientField : Type u
  matrixSize : Nat
  determinantNonzero : Prop
  inverseExists : Prop

structure MatrixInvertibilityEvidence {A : AdmissibleClass} (M : MatrixInvertibilityPackage A) where
  determinantNonzeroClosed : M.determinantNonzero
  inverseExistsClosed : M.inverseExists

def MatrixInvertibilityClosed {A : AdmissibleClass} (M : MatrixInvertibilityPackage A) : Prop :=
  M.determinantNonzero ∧ M.inverseExists

theorem matrix_invertibility_closed_from_evidence {A : AdmissibleClass}
    (M : MatrixInvertibilityPackage A) (E : MatrixInvertibilityEvidence M) :
    MatrixInvertibilityClosed M := by
  exact And.intro E.determinantNonzeroClosed E.inverseExistsClosed

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse