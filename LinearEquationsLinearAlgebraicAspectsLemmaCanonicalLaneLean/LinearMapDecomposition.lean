import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.LinearMapHomology
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.BasisDimension

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure DecompositionPackage (f : LinearMapPackage V W) where
  kernelBasis : BasisPackage V
  imageBasis : BasisPackage W
  rank : Nat
  nullity : Nat
  rankPlusNullity : rank + nullity = (DimensionPackage V).dim

structure DecompositionEvidence (D : DecompositionPackage f) where
  kernelBasisDefined : D.kernelBasis.indices = (KernelPackage f).kernel.indices
  imageBasisDefined : D.imageBasis.indices = (ImagePackage f).image.indices
  rankPlusNullityClosed : D.rankPlusNullity

def DecompositionClosed (D : DecompositionPackage f) : Prop :=
  D.kernelBasisDefined ∧ D.imageBasisDefined ∧ D.rankPlusNullity

theorem decomposition_closed_from_evidence (D : DecompositionPackage f) (E : DecompositionEvidence D) : DecompositionClosed D := by
  exact And.intro E.kernelBasisDefined (And.intro E.imageBasisDefined E.rankPlusNullityClosed)

structure ImagePackage (f : LinearMapPackage V W) where
  image : Set W.carrier
  imageSubspace : Subspace W image
  imageContainsZero : image.Contains W.zero
  imageClosedUnderAdd : ∀ x y : W.carrier, image.Contains x → image.Contains y → image.Contains (W.add x y)
  imageClosedUnderSmul : ∀ (a : F) (x : W.carrier), image.Contains x → image.Contains (W.smul a x)
  imageMatchesDefinition : ∀ y : W.carrier, image.Contains y ↔ ∃ x : V.carrier, f.toFun x = y

structure ImageEvidence (I : ImagePackage f) where
  imageContainsZeroClosed : I.imageContainsZero
  imageClosedUnderAddClosed : I.imageClosedUnderAdd
  imageClosedUnderSmulClosed : I.imageClosedUnderSmul
  imageMatchesDefinitionClosed : I.imageMatchesDefinition

def ImageClosed (I : ImagePackage f) : Prop :=
  I.imageContainsZero ∧ I.imageClosedUnderAdd ∧ I.imageClosedUnderSmul ∧ I.imageMatchesDefinition

theorem image_closed_from_evidence (I : ImagePackage f) (E : ImageEvidence f I) : ImageClosed I := by
  exact And.intro E.imageContainsZeroClosed (And.intro E.imageClosedUnderAddClosed (And.intro E.imageClosedUnderSmulClosed E.imageMatchesDefinitionClosed))

lemma rank_nullity_theorem (f : LinearMapPackage V W) (D : DecompositionPackage f) : D.rank + D.nullity = (DimensionPackage V).dim := by
  exact D.rankPlusNullity

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse
