package _17B_
{
   import _0Z_1.Panel;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.ui.Button;
   import _0xn._1uk;
   import com.company.assembleegameclient.game.GameSprite;
   import _1xa._dU_;
   
   public class _1X_A_ extends Panel
   {
       
      
      private const _1N_S_:SimpleText = _1uk._0M_n(16777215,16,true);
      
      private var icon:Bitmap;
      
      private var title:String = "Pets.petInteractionPanelTitle";
      
      private var _1lk:String = "Pets.petInteractionPanelFusePetButton";
      
      private var _13:String = "Pets.petInteractionPanelFeedPetButton";
      
      private var objectType:int;
      
      var _A_d:Button;
      
      var _M_a:Button;
      
      public function _1X_A_(param1:GameSprite, param2:int)
      {
         super(param1);
         this.objectType = param2;
         this._1N_S_.setStringBuilder(new _dU_().setParams(this.title));
         this._1N_S_.x = 48;
         this._1N_S_.y = 28;
         addChild(this._1N_S_);
         this._M_a = new Button(16,this._1lk);
         this._M_a.textChanged.addOnce(this._17U_);
         addChild(this._M_a);
         this._A_d = new Button(16,this._13);
         this._A_d.textChanged.addOnce(this._17U_);
         addChild(this._A_d);
      }
      
      public function init() : void
      {
         this.icon = _1uk._Z_q(this.objectType);
         this.icon.x = -4;
         this.icon.y = -8;
         addChild(this.icon);
      }
      
      private function _17U_() : void
      {
         this._M_a.x = WIDTH / 4 * 3 - this._M_a.width / 2;
         this._M_a.y = HEIGHT - this._M_a.height - 4;
         this._A_d.x = WIDTH / 4 * 1 - this._A_d.width / 2;
         this._A_d.y = HEIGHT - this._A_d.height - 4;
      }
   }
}
