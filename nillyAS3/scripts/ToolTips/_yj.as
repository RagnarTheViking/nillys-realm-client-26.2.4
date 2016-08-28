package ToolTips
{
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui._0fL_;
   import _v4.Client;
   import com.company.assembleegameclient.appengine.CharList;
   import com.company.assembleegameclient.appengine._0Z_6;
   import _1xa.AppendingLineBuilder;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.AnimatedLibrary;
   import com.company.assembleegameclient.util._Z_4;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util._1eD_;
   import flash.geom.ColorTransform;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import _C_._1O_I_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import kabam.rotmg.assets.services._157;
   import com.company.assembleegameclient.util.Star;
   
   public class _yj extends ToolTip
   {
       
      
      private var _0P_q:Bitmap;
      
      private var nameText_:SimpleText;
      
      private var _1N_x:SimpleText;
      
      private var _1__B_:_0fL_;
      
      private var bestLevel_:SimpleText;
      
      private var _dR_:SimpleText;
      
      private var unlockText_:SimpleText;
      
      private var nextClassQuest_:SimpleText;
      
      private var costText_:SimpleText;
      
      private var _0m0:Bitmap;
      
      private var _1mK_:Boolean;
      
      public function _yj(param1:XML, param2:Client, param3:_0Z_6)
      {
         var _loc4_:AppendingLineBuilder = null;
         var _loc5_:XML = null;
         var _loc6_:BitmapData = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         super(3552822,1,16777215,1);
         var _loc11_:_Z_4 = AnimatedLibrary._0B_e(String(param1.AnimatedTexture.File),int(param1.AnimatedTexture.Index));
         var _loc12_:_18Q_ = _loc11_.imageFromDir(_Z_4.RIGHT,_Z_4._M_J_,0);
         var _loc13_:int = 4 / _loc12_.width() * 100;
         var _loc14_:BitmapData = TextureRedrawer.redraw(_loc12_.image_,_loc13_,true,0);
         this._1mK_ = this._13k(param2,param1);
         if(this._1mK_)
         {
            _loc14_ = _1eD_._6U_(_loc14_,new ColorTransform(0,0,0,0.5,0,0,0,0));
         }
         this._0P_q = new Bitmap();
         this._0P_q.bitmapData = _loc14_;
         this._0P_q.x = -4;
         this._0P_q.y = -4;
         addChild(this._0P_q);
         this.nameText_ = new SimpleText().setSize(13).setColor(11776947);
         this.nameText_.setBold(true);
         this.nameText_.setStringBuilder(new _dU_().setParams(param1.DisplayId));
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         _01T_.push(this.nameText_.textChanged);
         addChild(this.nameText_);
         this._1N_x = new SimpleText().setSize(13).setColor(11776947).setWordWrap(true).setMultiLine(true).setTextWidth(174);
         this._1N_x.setStringBuilder(new _dU_().setParams(param1.Description));
         this._1N_x.filters = [new DropShadowFilter(0,0,0)];
         _01T_.push(this._1N_x.textChanged);
         addChild(this._1N_x);
         this._1__B_ = new _0fL_(100,1842204);
         addChild(this._1__B_);
         if(this._1mK_)
         {
            this._dR_ = new SimpleText().setSize(13).setColor(11776947).setTextWidth(174).setBold(true);
            this._dR_.setStringBuilder(new _dU_().setParams(_1O_I_._0E_h));
            this._dR_.filters = [new DropShadowFilter(0,0,0)];
            _01T_.push(this._dR_.textChanged);
            addChild(this._dR_);
            this.unlockText_ = new SimpleText().setSize(13).setColor(16549442).setTextWidth(174).setWordWrap(false).setMultiLine(true);
            _loc4_ = new AppendingLineBuilder();
            for each(_loc5_ in param1.UnlockLevel)
            {
               _loc7_ = ObjectLibrary._07h[_loc5_.toString()];
               _loc8_ = int(_loc5_.@level);
               if(param2.getBestLevel(_loc7_) < int(_loc5_.@level))
               {
                  _loc4_.pushParams(_1O_I_._1P_U_,{
                     "unlockLevel":_loc8_,
                     "typeToDisplay":ObjectLibrary._O_S_[_loc7_]
                  });
               }
            }
            this.unlockText_.setStringBuilder(_loc4_);
            this.unlockText_.filters = [new DropShadowFilter(0,0,0)];
            _01T_.push(this.unlockText_.textChanged);
            addChild(this.unlockText_);
            this.costText_ = new SimpleText().setSize(13).setColor(65280);
            this.costText_.setStringBuilder(new _dU_().setParams(_1O_I_._1M_8,{"unlockCost":param1.UnlockCost}));
            this.costText_.filters = [new DropShadowFilter(0,0,0)];
            _01T_.push(this.costText_.textChanged);
            addChild(this.costText_);
            _loc6_ = _157.makeCoin();
            this._0m0 = new Bitmap(_loc6_);
            addChild(this._0m0);
         }
         else
         {
            _loc9_ = param3 == null?0:int(param3.numStars());
            this.bestLevel_ = new SimpleText().setSize(14).setColor(6206769).setMultiLine(true);
            this.bestLevel_.setStringBuilder(new _dU_().setParams(_1O_I_._0bA_,{
               "numStars":_loc9_,
               "bestLevel":(param3 != null?param3.bestLevel():0),
               "fame":(param3 != null?param3._1hK_():0)
            }));
            this.bestLevel_.filters = [new DropShadowFilter(0,0,0)];
            _01T_.push(this.bestLevel_.textChanged);
            addChild(this.bestLevel_);
            _loc10_ = Star.nextStarFame(param3 == null?0:int(param3._1hK_()),0);
            if(_loc10_ > 0)
            {
               this.nextClassQuest_ = new SimpleText().setSize(13).setColor(16549442).setTextWidth(160).setMultiLine(true).setWordWrap(true);
               this.nextClassQuest_.setStringBuilder(new _dU_().setParams(_1O_I_._1D_8,{
                  "nextStarFame":_loc10_,
                  "typeToDisplay":param1.DisplayId
               }));
               this.nextClassQuest_.filters = [new DropShadowFilter(0,0,0)];
               _01T_.push(this.nextClassQuest_.textChanged);
               addChild(this.nextClassQuest_);
            }
         }
      }
      
      override protected function alignUI() : void
      {
         this.nameText_.x = 32;
         this.nameText_.y = 6;
         this._1N_x.x = 8;
         this._1N_x.y = 40;
         this._1__B_.x = 6;
         this._1__B_.y = height;
         if(this._1mK_)
         {
            this._dR_.x = 8;
            this._dR_.y = height - 2;
            this.unlockText_.x = 12;
            this.unlockText_.y = height - 4;
            this.costText_.x = 12;
            this.costText_.y = height - 4;
            this._0m0.y = this.costText_.y - 2;
            this._0m0.x = this.costText_.x + this.costText_.getBounds(this.costText_).width + 4;
         }
         else
         {
            this.bestLevel_.x = 8;
            this.bestLevel_.y = height - 2;
            if(this.nextClassQuest_)
            {
               this.nextClassQuest_.x = 8;
               this.nextClassQuest_.y = height - 2;
            }
         }
         this.draw();
         position();
      }
      
      private function _13k(param1:Client, param2:XML) : Boolean
      {
         var _loc3_:Boolean = param1._1bH_(String(param2.@id),CharList._1lc);
         var _loc4_:Boolean = param1._1G_H_(int(param2.@type));
         return !_loc3_ && !_loc4_;
      }
      
      override public function draw() : void
      {
         this._1__B_._0Z_i(width - 10,1842204);
         super.draw();
      }
   }
}
