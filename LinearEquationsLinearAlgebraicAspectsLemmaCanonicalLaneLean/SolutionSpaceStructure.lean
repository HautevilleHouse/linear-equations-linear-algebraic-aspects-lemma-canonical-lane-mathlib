import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.LinearEquationObject

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearEquation (V : LinearSpace) where
  coefficients : V.carrier → V.scalarField
  rightHandSide : V.scalarField
  solutionSet : Set V.carrier
  isLinear : Prop

structure SolutionSpacePackage {V : LinearSpace} (eq : LinearEquation V) where
  solutionSetSubspace : Prop
  homogeneousSolutionSpace : Subspace V
  particularSolutionExists : Prop
  solutionSetAffine : Prop

structure SolutionSpaceEvidence {V : LinearSpace} {eq : LinearEquation V} (S : SolutionSpacePackage eq) where
  solutionSetSubspaceClosed : S.solutionSetSubspace
  particularSolutionExistsClosed : S.particularSolutionExists
  solutionSetAffineClosed : S.solutionSetAffine

def SolutionSpaceClosed {V : LinearSpace} {eq : LinearEquation V} (S : SolutionSpacePackage eq) : Prop :=
  S.solutionSetSubspace ∧ S.particularSolutionExists ∧ S.solutionSetAffine

theorem solution_space_closed_from_evidence {V : LinearSpace} {eq : LinearEquation V} (S : SolutionSpacePackage eq) (E : SolutionSpaceEvidence S) : SolutionSpaceClosed S := by
  exact And.intro E.solutionSetSubspaceClosed (And.intro E.particularSolutionExistsClosed E.solutionSetAffineClosed)

structure Subspace (V : LinearSpace) where
  carrier : Set V.carrier
  zeroContained : V.zeroElement ∈ carrier
  closedUnderAdd : ∀ x y, x ∈ carrier → y ∈ carrier → V.addition x y ∈ carrier
  closedUnderScalar : ∀ (a : V.scalarField) (x : V.carrier), x ∈ carrier → V.scalarMultiplication a x ∈ carrier

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse