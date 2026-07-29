import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure RepresentationTheoremPackage where
  linearMapSpace : Type u
  dualSpace : Type v
  naturalIsomorphism : Prop
  finiteDimensional : Prop
  reflexivity : Prop

structure RepresentationTheoremEvidence (R : RepresentationTheoremPackage) where
  naturalIsomorphismClosed : R.naturalIsomorphism
  finiteDimensionalClosed : R.finiteDimensional
  reflexivityClosed : R.reflexivity

def RepresentationTheoremClosed (R : RepresentationTheoremPackage) : Prop :=
  R.naturalIsomorphism ∧ R.finiteDimensional ∧ R.reflexivity

theorem representation_theorem_closed_from_evidence
    (R : RepresentationTheoremPackage) (E : RepresentationTheoremEvidence R) :
    RepresentationTheoremClosed R := by
  exact And.intro E.naturalIsomorphismClosed
    (And.intro E.finiteDimensionalClosed E.reflexivityClosed)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse