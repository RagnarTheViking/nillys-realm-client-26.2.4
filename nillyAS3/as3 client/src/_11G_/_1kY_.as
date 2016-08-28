package _11G_
{
   import _1ar.Command;
   import com.company.assembleegameclient.game.GameSprite;
   import _S_b._O_e;
   import _K_r._yK_;
   
   public class _1kY_ extends Command
   {
       
      
      [Inject]
      public var _14O_:GameSprite;
      
      [Inject]
      public var model:_O_e;
      
      [Inject]
      public var _a__:_yK_;
      
      public function _1kY_()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.model._14O_ = this._14O_;
         this._a__.dispatch();
      }
   }
}
