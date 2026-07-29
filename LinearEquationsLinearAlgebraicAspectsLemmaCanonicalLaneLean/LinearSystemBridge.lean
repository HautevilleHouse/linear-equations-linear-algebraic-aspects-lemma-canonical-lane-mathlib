import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearSystem where
  equations : Nat
  variables : Nat
  coefficientMatrix : Type u
  solutionSpace : Prop
  basisConstructed : Prop
  dimensionConsistent : equations = variables → solutionSpace

structure LinearSystemEvidence (L : LinearSystem) where
  solutionSpaceClosed : L.solutionSpace
  basisConstructedClosed : L.basisConstructed
  dimensionConsistentClosed : L.dimensionConsistent

def LinearSystemClosed (L : LinearSystem) : Prop :=
  L.solutionSpace ∧ L.basisConstructed ∧ (L.equations = L.variables → L.solutionSpace)

theorem linear_system_closed_from_evidence (L : LinearSystem) (E : LinearSystemEvidence L) :
    LinearSystemClosed L := by
  refine And.intro E.solutionSpaceClosed (And.intro E.basisConstructedClosed ?_)
  intro h
  exact E.dimensionConsistentClosed h

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse