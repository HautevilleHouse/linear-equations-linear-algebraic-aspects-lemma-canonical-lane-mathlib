import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.VectorSpaceStructure

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure BasisPackage (V : VectorSpacePackage F) where
  indices : Type u
  vectors : indices → V.carrier
  linearIndependent : LinearIndependent V vectors
  spanning : Spanning V vectors

structure BasisEvidence (B : BasisPackage V) where
  linearIndependentClosed : B.linearIndependent
  spanningClosed : B.spanning

def BasisClosed (B : BasisPackage V) : Prop :=
  B.linearIndependent ∧ B.spanning

theorem basis_closed_from_evidence (B : BasisPackage V) (E : BasisEvidence B) : BasisClosed B := by
  exact And.intro E.linearIndependentClosed E.spanningClosed

structure DimensionPackage (V : VectorSpacePackage F) where
  dim : Nat
  basisExists : ∃ B : BasisPackage V, true
  dimIsCard : ∀ B : BasisPackage V, dim = Cardinal.toNat (Cardinal.mk B.indices)

structure DimensionEvidence (D : DimensionPackage V) where
  basisExistsClosed : D.basisExists
  dimIsCardClosed : D.dimIsCard

def DimensionClosed (D : DimensionPackage V) : Prop :=
  D.basisExists ∧ D.dimIsCard

theorem dimension_closed_from_evidence (D : DimensionPackage V) (E : DimensionEvidence D) : DimensionClosed D := by
  exact And.intro E.basisExistsClosed E.dimIsCardClosed

lemma dimension_well_defined (V : VectorSpacePackage F) (D1 D2 : DimensionPackage V) : D1.dim = D2.dim := by
  sorry

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse
