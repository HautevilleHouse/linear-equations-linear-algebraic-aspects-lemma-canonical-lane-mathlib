import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.LinearEquationObject

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure BasisRepresentationPackage {V : LinearSpace} where
  basis : Set V.carrier
  linearlyIndependent : Prop
  spanning : Prop
  basisRepresentation : V.carrier → (V.scalarField → V.carrier)
  representationUnique : Prop

structure BasisRepresentationEvidence (B : BasisRepresentationPackage) where
  linearlyIndependentClosed : B.linearlyIndependent
  spanningClosed : B.spanning
  representationUniqueClosed : B.representationUnique

def BasisRepresentationClosed (B : BasisRepresentationPackage) : Prop :=
  B.linearlyIndependent ∧ B.spanning ∧ B.representationUnique

theorem basis_representation_closed_from_evidence (B : BasisRepresentationPackage) (E : BasisRepresentationEvidence B) : BasisRepresentationClosed B := by
  exact And.intro E.linearlyIndependentClosed (And.intro E.spanningClosed E.representationUniqueClosed)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse