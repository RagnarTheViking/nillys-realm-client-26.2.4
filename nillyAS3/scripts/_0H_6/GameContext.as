package _0H_6
{
   import _I_w._0iQ_;
   import _wi.Injector;
   
   public class GameContext extends _0iQ_
   {
      
      public static var _T_X_:Injector;
       
      
      public function GameContext()
      {
         super();
         if(!GameContext._T_X_)
         {
            GameContext._T_X_ = this._T_X_;
         }
      }
      
      public static function getInjector() : Injector
      {
         return _T_X_;
      }
   }
}
