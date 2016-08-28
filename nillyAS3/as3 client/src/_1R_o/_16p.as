package _1R_o
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _0f.IMediatorMap;
   import _1A_k._J_D_;
   import _1A_k._0p8;
   
   public class _16p implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function _16p()
      {
         super();
      }
      
      public function configure() : void
      {
         this.mediatorMap.map(_J_D_).toMediator(_0p8);
      }
   }
}
