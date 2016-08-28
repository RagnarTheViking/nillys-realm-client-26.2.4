package _11G_
{
   import _1T_4._0es;
   import _m2._1N_l;
   import _05g.TitleView;
   
   public class _1O_M_
   {
       
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _050:_1N_l;
      
      public function _1O_M_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._kU_.dispatch(new TitleView());
         this._050.dispatch();
      }
   }
}
