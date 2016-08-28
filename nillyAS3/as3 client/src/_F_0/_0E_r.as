package _F_0
{
   import _0Z_1.Panel;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.ui._0W_D_;
   import com.company.assembleegameclient.game.GameSprite;
   import _0xn._1uk;
   import _1xa.SText;
   
   public class _0E_r extends Panel
   {
       
      
      private const _1N_S_:SimpleText = _1uk._0M_n(16777215,18,true);
      
      private var icon:Bitmap;
      
      private var title:String = "The Tinkerer";
      
      private var _13:String = "See Offers";
      
      private var objectType:int;
      
      var _A_d:_0W_D_;
      
      public function _0E_r(param1:GameSprite)
      {
         super(param1);
         this.icon = _1uk._Z_q(5972);
         this.icon.x = -4;
         this.icon.y = -8;
         addChild(this.icon);
         this.objectType = 5972;
         this._1N_S_.setStringBuilder(new SText(this.title));
         this._1N_S_.x = 78;
         this._1N_S_.y = 28;
         addChild(this._1N_S_);
         this._A_d = new _0W_D_(16,this._13);
         this._A_d.textChanged.addOnce(this._17U_);
         addChild(this._A_d);
      }
      
      public function init() : void
      {
      }
      
      private function _17U_() : void
      {
         this._A_d.x = WIDTH / 2 - this._A_d.width / 2;
         this._A_d.y = HEIGHT - this._A_d.height - 4;
      }
   }
}
