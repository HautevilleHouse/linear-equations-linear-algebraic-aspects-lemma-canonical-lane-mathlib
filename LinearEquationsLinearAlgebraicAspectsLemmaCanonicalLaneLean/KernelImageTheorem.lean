import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

/-!
# Kernel and Image Decomposition Package
-/

structure KernelImagePackage {V W : Type u} [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] where
  linearMap : V →ₗ[ℝ] W
  kernel : Submodule ℝ V
  image : Submodule ℝ W
  kernelDefinedAs : kernel = LinearMap.ker linearMap
  imageDefinedAs : image = LinearMap.range linearMap
  rankNullityRelation : finrank ℝ V = finrank ℝ kernel + finrank ℝ image

def rankNullityRelationTermProp : Prop := True

structure KernelImageEvidence {V W : Type u} [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] (K : KernelImagePackage V W) where
  kernelDefinedAsClosed : K.kernelDefinedAs
  imageDefinedAsClosed : K.imageDefinedAs
  rankNullityRelationClosed : K.rankNullityRelation

def KernelImageClosed {V W : Type u} [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] (K : KernelImagePackage V W) : Prop :=
  K.kernelDefinedAs ∧ K.imageDefinedAs ∧ K.rankNullityRelation

theorem kernel_image_closed_from_evidence {V W : Type u} [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W]
    (K : KernelImagePackage V W) (E : KernelImageEvidence K) : KernelImageClosed K :=
  And.intro E.kernelDefinedAsClosed (And.intro E.imageDefinedAsClosed E.rankNullityRelationClosed)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse