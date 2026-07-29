import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearSystemPackage where
  coefficientField : Type u
  vectorSpace : Type v
  systemSize : Nat × Nat
  coefficientMatrix : vectorSpace → vectorSpace  -- linear transformation
  rightHandSide : vectorSpace
  solutionSpace : Set vectorSpace

structure LinearSystemEvidence (L : LinearSystemPackage) where
  solutionSetNonempty : L.solutionSpace.Nonempty
  solutionSetAffine : ∀ x y ∈ L.solutionSpace, ∀ t : L.coefficientField, t • x + (1 - t) • y ∈ L.solutionSpace
  linearMapMatches : L.coefficientMatrix = λ v => L.coefficientMatrix v

def LinearSystemClosed (L : LinearSystemPackage) : Prop :=
  L.solutionSpace.Nonempty ∧
  (∀ x y ∈ L.solutionSpace, ∀ t : L.coefficientField, t • x + (1 - t) • y ∈ L.solutionSpace) ∧
  True

theorem linear_system_closed_from_evidence (L : LinearSystemPackage) (E : LinearSystemEvidence L) : LinearSystemClosed L := by
  refine And.intro E.solutionSetNonempty ?_
  refine And.intro E.solutionSetAffine trivial

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse