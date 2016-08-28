package _in_
{
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _T_G_._1J_G_;
   import _4g._0zQ_;
   import _4g._1vC_;
   
   public class _vZ_
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function _vZ_()
      {
         super();
      }
      
      [PostConstruct]
      public function setup() : void
      {
         this._T_X_.map(_1J_G_).asSingleton();
         this.mediatorMap.map(_0zQ_).toMediator(_1vC_);
      }
   }
}
