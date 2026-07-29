import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearSystemSolver (V : Type u) [AddCommGroup V] [Module ℝ V] where
  coefficientMatrix : Matrix (Fin n) (Fin m) ℝ
  rightHandSide : V
  solutionVector : V
  satisfiesEquations : coefficientMatrix.mulVec solutionVector = rightHandSide
  uniqueSolution : Prop
  uniqueSolutionTerm : uniqueSolution

structure LinearSystemEvidence {V : Type u} [AddCommGroup V] [Module ℝ V] (S : LinearSystemSolver V) where
  satisfiesEquationsClosed : S.satisfiesEquations
  uniqueSolutionClosed : S.uniqueSolution

def LinearSystemClosed {V : Type u} [AddCommGroup V] [Module ℝ V] (S : LinearSystemSolver V) : Prop :=
  S.satisfiesEquations ∧ S.uniqueSolution

theorem linear_system_closed_from_evidence {V : Type u} [AddCommGroup V] [Module ℝ V]
    (S : LinearSystemSolver V) (E : LinearSystemEvidence S) : LinearSystemClosed S :=
  And.intro E.satisfiesEquationsClosed E.uniqueSolutionClosed

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse