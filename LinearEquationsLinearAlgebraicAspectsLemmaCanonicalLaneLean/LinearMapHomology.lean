import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.VectorSpaceStructure

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearMapPackage (V W : VectorSpacePackage F) where
  toFun : V.carrier → W.carrier
  additive : ∀ x y : V.carrier, toFun (V.add x y) = W.add (toFun x) (toFun y)
  homogeneous : ∀ (a : F) (x : V.carrier), toFun (V.smul a x) = W.smul a (toFun x)

structure LinearMapEvidence (f : LinearMapPackage V W) where
  additiveClosed : f.additive
  homogeneousClosed : f.homogeneous

def LinearMapClosed (f : LinearMapPackage V W) : Prop :=
  f.additive ∧ f.homogeneous

theorem linear_map_closed_from_evidence (f : LinearMapPackage V W) (E : LinearMapEvidence f) : LinearMapClosed f := by
  exact And.intro E.additiveClosed E.homogeneousClosed

structure KernelPackage (f : LinearMapPackage V W) where
  kernel : Set V.carrier
  kernelSubspace : Subspace V (Subtype fun x : V.carrier => kernel.Contains x)
  kernelContainsZero : kernel.Contains V.zero
  kernelClosedUnderAdd : ∀ x y : V.carrier, kernel.Contains x → kernel.Contains y → kernel.Contains (V.add x y)
  kernelClosedUnderSmul : ∀ (a : F) (x : V.carrier), kernel.Contains x → kernel.Contains (V.smul a x)
  kernelMatchesZero : ∀ x : V.carrier, kernel.Contains x ↔ f.toFun x = W.zero

structure KernelEvidence (K : KernelPackage f) where
  kernelContainsZeroClosed : K.kernelContainsZero
  kernelClosedUnderAddClosed : K.kernelClosedUnderAdd
  kernelClosedUnderSmulClosed : K.kernelClosedUnderSmul
  kernelMatchesZeroClosed : K.kernelMatchesZero

def KernelClosed (K : KernelPackage f) : Prop :=
  K.kernelContainsZero ∧ K.kernelClosedUnderAdd ∧ K.kernelClosedUnderSmul ∧ K.kernelMatchesZero

theorem kernel_closed_from_evidence (K : KernelPackage f) (E : KernelEvidence f K) : KernelClosed K := by
  exact And.intro E.kernelContainsZeroClosed (And.intro E.kernelClosedUnderAddClosed (And.intro E.kernelClosedUnderSmulClosed E.kernelMatchesZeroClosed))

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse
