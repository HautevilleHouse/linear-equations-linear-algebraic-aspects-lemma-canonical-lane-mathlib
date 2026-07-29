import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearMapRepresentationPackage (A : AdmissibleClass) where
  domain : Type u
  codomain : Type v
  linearMap : domain → codomain
  kernel : Prop
  image : Prop
  rankNullity : Prop

structure LinearMapRepresentationEvidence {A : AdmissibleClass} (P : LinearMapRepresentationPackage A) where
  kernelClosed : P.kernel
  imageClosed : P.image
  rankNullityClosed : P.rankNullity

def LinearMapRepresentationClosed {A : AdmissibleClass} (P : LinearMapRepresentationPackage A) : Prop :=
  P.kernel ∧ P.image ∧ P.rankNullity

theorem linear_map_representation_closed_from_evidence {A : AdmissibleClass}
    (P : LinearMapRepresentationPackage A) (E : LinearMapRepresentationEvidence P) :
    LinearMapRepresentationClosed P := by
  exact And.intro E.kernelClosed (And.intro E.imageClosed E.rankNullityClosed)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse