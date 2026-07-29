import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure LinearSpace where
  carrier : Type
  scalarField : Type
  addition : carrier → carrier → carrier
  scalarMultiplication : scalarField → carrier → carrier
  zeroElement : carrier
  addAssoc : ∀ x y z : carrier, addition (addition x y) z = addition x (addition y z)
  addComm : ∀ x y : carrier, addition x y = addition y x
  zeroAdd : ∀ x : carrier, addition zeroElement x = x
  addZero : ∀ x : carrier, addition x zeroElement = x
  addInverse : ∀ x : carrier, ∃ y : carrier, addition x y = zeroElement
  scalarMulAssoc : ∀ (a b : scalarField) (x : carrier), scalarMultiplication (a * b) x = scalarMultiplication a (scalarMultiplication b x)
  scalarMulOne : ∀ x : carrier, scalarMultiplication (1 : scalarField) x = x
  scalarDistrib : ∀ (a : scalarField) (x y : carrier), scalarMultiplication a (addition x y) = addition (scalarMultiplication a x) (scalarMultiplication a y)
  scalarDistrib2 : ∀ (a b : scalarField) (x : carrier), scalarMultiplication (a + b) x = addition (scalarMultiplication a x) (scalarMultiplication b x)

structure LinearMap (V W : LinearSpace) where
  toFun : V.carrier → W.carrier
  additivity : ∀ x y : V.carrier, toFun (V.addition x y) = W.addition (toFun x) (toFun y)
  homogeneity : ∀ (a : V.scalarField) (x : V.carrier), toFun (V.scalarMultiplication a x) = W.scalarMultiplication a (toFun x)

structure AdmittedLinearObject where
  space : LinearSpace
  linearMap : LinearMap space space
  isInvertible : Prop
  invertibilityWitness : isInvertible

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse