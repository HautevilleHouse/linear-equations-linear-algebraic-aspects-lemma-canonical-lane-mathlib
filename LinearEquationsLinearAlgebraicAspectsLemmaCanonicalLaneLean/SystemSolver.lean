import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure SystemSolverPackage (A : AdmissibleClass) where
  equations : Nat
  unknowns : Nat
  coefficientMatrix : Type u
  solutionSet : Prop
  homogeneousSolution : Prop
  particularSolution : Prop

structure SystemSolverEvidence {A : AdmissibleClass} (S : SystemSolverPackage A) where
  solutionSetClosed : S.solutionSet
  homogeneousSolutionClosed : S.homogeneousSolution
  particularSolutionClosed : S.particularSolution

def SystemSolverClosed {A : AdmissibleClass} (S : SystemSolverPackage A) : Prop :=
  S.solutionSet ∧ S.homogeneousSolution ∧ S.particularSolution

theorem system_solver_closed_from_evidence {A : AdmissibleClass}
    (S : SystemSolverPackage A) (E : SystemSolverEvidence S) :
    SystemSolverClosed S := by
  exact And.intro E.solutionSetClosed (And.intro E.homogeneousSolutionClosed E.particularSolutionClosed)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse