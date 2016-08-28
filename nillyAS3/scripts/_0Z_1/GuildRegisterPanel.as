package _0Z_1
{
   import _f7.Signal;
   import _05g._1S_m;
   import _1gF_.SimpleText;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import _T_n._1gJ_;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.objects.Player;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.util.GuildUtil;
   import _1xa._dU_;
   import _C_._1O_I_;
   import com.company.assembleegameclient.ui.Button;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.util.Currency;
   
   public class GuildRegisterPanel extends Panel
   {
       
      
      public const _09X_:Signal = new Signal();
      
      public const _01T_:_1S_m = new _1S_m();
      
      public const renounce:Signal = new Signal();
      
      private var _00M_:SimpleText;
      
      private var _19t:Sprite;
      
      public function GuildRegisterPanel(param1:GameSprite)
      {
         var _loc2_:Player = null;
         var _loc3_:String = null;
         var _loc4_:_1gJ_ = null;
         super(param1);
         if(gs_.map == null || gs_.map.player_ == null)
         {
            return;
         }
         _loc2_ = gs_.map.player_;
         this._00M_ = new SimpleText().setSize(18).setColor(16777215).setTextWidth(WIDTH).setWordWrap(true).setMultiLine(true).setAutoSize(TextFieldAutoSize.CENTER).setHTML(true);
         this._00M_.filters = [new DropShadowFilter(0,0,0)];
         if(_loc2_.guildName_ != null && _loc2_.guildName_.length > 0)
         {
            _loc3_ = GuildUtil._oB_(_loc2_.guildRank_);
            this._00M_.setStringBuilder(new _dU_().setParams(_1O_I_._40,{
               "rank":_loc3_,
               "guildName":_loc2_.guildName_
            }).setPrefix("<p align=\"center\">").setPostfix("</p>"));
            this._00M_.y = 0;
            addChild(this._00M_);
            this._19t = new Button(16,_1O_I_._0cu);
            this._19t.addEventListener(MouseEvent.CLICK,this._0N_H_);
            this._01T_.push(Button(this._19t).textChanged);
            addChild(this._19t);
         }
         else
         {
            this._00M_.setStringBuilder(new _dU_().setParams(_1O_I_._1wD_).setPrefix("<p align=\"center\">").setPostfix("</p>"));
            this._00M_.y = 0;
            addChild(this._00M_);
            _loc4_ = new _1gJ_(_1O_I_._g0,16,Parameters._R_f,Currency.FAME);
            _loc4_.addEventListener(MouseEvent.CLICK,this._0w5);
            this._01T_.push(_loc4_._0T_g);
            addChild(_loc4_);
            this._19t = _loc4_;
         }
         this._01T_.complete.addOnce(this.alignUI);
      }
      
      private function _0N_H_(param1:MouseEvent) : void
      {
         this.renounce.dispatch();
      }
      
      private function alignUI() : void
      {
         this._19t.x = WIDTH / 2 - this._19t.width / 2;
         this._19t.y = this._19t is _1gJ_?Number(HEIGHT - this._19t.height / 2 - 31):Number(HEIGHT - this._19t.height - 4);
      }
      
      public function _0w5(param1:MouseEvent) : void
      {
         visible = false;
         this._09X_.dispatch();
      }
   }
}
