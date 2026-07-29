import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.VectorSpaceStructure

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearEquationSystem (V : VectorSpacePackage F) where
  equations : List (V.carrier → F)
  rhs : List F
  equationCount : Nat := equations.length
  consistent : Prop
  solutionSet : Set V.carrier

structure LinearEquationSystemEvidence (S : LinearEquationSystem V) where
  consistentClosed : S.consistent
  solutionSetClosed : S.solutionSet = {x : V.carrier | ∀ i : Fin S.equations.length, S.equations[i] x = S.rhs[i]}

def LinearEquationSystemClosed (S : LinearEquationSystem V) : Prop :=
  S.consistent ∧ (S.solutionSet = {x : V.carrier | ∀ i : Fin S.equations.length, S.equations[i] x = S.rhs[i]})

theorem linear_equation_system_closed_from_evidence (S : LinearEquationSystem V) (E : LinearEquationSystemEvidence S) : LinearEquationSystemClosed S := by
  exact And.intro E.consistentClosed E.solutionSetClosed

structure HomogeneousSystem (V : VectorSpacePackage F) extends LinearEquationSystem V where
  homogeneous : ∀ (eq : V.carrier → F), eq ∈ equations → eq V.zero = 0
  rhsAllZero : ∀ (b : F), b ∈ rhs → b = 0

structure HomogeneousSystemEvidence (HS : HomogeneousSystem V) where
  homogeneousClosed : HS.homogeneous
  rhsAllZeroClosed : HS.rhsAllZero

def HomogeneousSystemClosed (HS : HomogeneousSystem V) : Prop :=
  HS.homogeneous ∧ HS.rhsAllZero

theorem homogeneous_system_closed_from_evidence (HS : HomogeneousSystem V) (E : HomogeneousSystemEvidence HS) : HomogeneousSystemClosed HS := by
  exact And.intro E.homogeneousClosed E.rhsAllZeroClosed

lemma homogeneous_solution_subspace (HS : HomogeneousSystem V) : Subspace V HS.solutionSet := by
  sorry

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse
