import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

/-!
# Fundamental Theorem of Linear Algebra Package
-/

structure FundamentalTheoremPackage {V W : Type u} [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] where
  linearMap : V →ₗ[ℝ] W
  kernel : Submodule ℝ V
  image : Submodule ℝ W
  kernelComplement : Submodule ℝ V
  imageComplement : Submodule ℝ W
  orthogonalDecompositionV : V = kernel ⊕ kernelComplement
  orthogonalDecompositionW : Submodule.span ℝ (Set.range linearMap) = image
  rankPlusNullity : finrank ℝ V = finrank ℝ image + finrank ℝ kernel
  kernelComplementIsomorphicToImage : kernelComplement ≃ₗ[ℝ] image

def orthogonalDecompositionVTerm : Prop := True

def orthogonalDecompositionWTerm : Prop := True

structure FundamentalTheoremEvidence {V W : Type u} [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] (F : FundamentalTheoremPackage V W) where
  orthogonalDecompositionVClosed : F.orthogonalDecompositionV
  orthogonalDecompositionWClosed : F.orthogonalDecompositionW
  rankPlusNullityClosed : F.rankPlusNullity
  kernelComplementIsomorphicToImageClosed : F.kernelComplementIsomorphicToImage

def FundamentalTheoremClosed {V W : Type u} [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] (F : FundamentalTheoremPackage V W) : Prop :=
  F.orthogonalDecompositionV ∧ F.orthogonalDecompositionW ∧ F.rankPlusNullity ∧ F.kernelComplementIsomorphicToImage

theorem fundamental_theorem_closed_from_evidence {V W : Type u} [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W]
    (F : FundamentalTheoremPackage V W) (E : FundamentalTheoremEvidence F) : FundamentalTheoremClosed F :=
  And.intro E.orthogonalDecompositionVClosed (And.intro E.orthogonalDecompositionWClosed (And.intro E.rankPlusNullityClosed E.kernelComplementIsomorphicToImageClosed))

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse