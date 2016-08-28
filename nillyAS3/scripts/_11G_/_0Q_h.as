package _11G_
{
   import _05g._L_D_;
   import flash.display.DisplayObjectContainer;
   
   public class _0Q_h
   {
      
      private static var show:Boolean = true;
      
      private static var view:_L_D_;
       
      
      [Inject]
      public var _0ki:DisplayObjectContainer;
      
      public function _0Q_h()
      {
         super();
      }
      
      public function execute() : void
      {
         if(show)
         {
            view = new _L_D_();
            view.x = 4;
            view.y = 4;
            this._0ki.addChild(view);
            show = false;
         }
         else
         {
            this._0ki.removeChild(view);
            view = null;
            show = true;
         }
      }
   }
}
