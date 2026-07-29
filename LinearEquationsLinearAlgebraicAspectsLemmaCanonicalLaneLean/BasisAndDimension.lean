import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure BasisAndDimensionPackage (A : AdmissibleClass) where
  vectorSpace : Type u
  basisProposed : List (vectorSpace)
  linearIndependence : Prop
  spanning : Prop
  dimensionConsistent : Prop

structure BasisAndDimensionEvidence {A : AdmissibleClass} (B : BasisAndDimensionPackage A) where
  linearIndependenceClosed : B.linearIndependence
  spanningClosed : B.spanning
  dimensionConsistentClosed : B.dimensionConsistent

def BasisAndDimensionClosed {A : AdmissibleClass} (B : BasisAndDimensionPackage A) : Prop :=
  B.linearIndependence ∧ B.spanning ∧ B.dimensionConsistent

theorem basis_and_dimension_closed_from_evidence {A : AdmissibleClass}
    (B : BasisAndDimensionPackage A) (E : BasisAndDimensionEvidence B) :
    BasisAndDimensionClosed B := by
  exact And.intro E.linearIndependenceClosed (And.intro E.spanningClosed E.dimensionConsistentClosed)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse