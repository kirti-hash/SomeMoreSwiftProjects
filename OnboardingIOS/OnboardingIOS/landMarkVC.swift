//
//  landMarkVC.swift
//  OnboardingIOS
//
//  Created by MRT102 on 19/10/23.
//

import UIKit

class landMarkVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var myIMage: UIImageView!
    
    
    
    @IBOutlet weak var tblContent: UITableView!
    
    let data = [
        [
            "image": "1",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        ],
        [
            "image": "2",
            "description": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        ],
        [
            "image": "3",
            "description": "vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat "
        ],
        [
            "image": "4",
            "description": "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed eu sollicitudin sapien. Cras quis risus ac massa aliquet semper. Vivamus in quam tempor, dignissim purus sed, aliquet urna. Quisque enim risus, sollicitudin vel magna at, aliquet imperdiet enim. Quisque dictum suscipit tincidunt. Maecenas vel fringilla orci. Etiam sit amet posuere nisi. Aenean lobortis lobortis libero, vitae fringilla metus. Etiam et tristique urna. Quisque vestibulum diam nulla, vitae dapibus arcu luctus at. Duis dapibus luctus feugiat."
        ],
        [
            "image": "5",
            "description": "Pellentesque sit amet mollis eros. Nullam rutrum consequat ex eget auctor. Aenean faucibus risus et risus mattis, in consectetur libero tincidunt. Integer vitae ornare leo, eget ullamcorper nunc. Pellentesque congue, neque vitae interdum imperdiet, mi nibh pellentesque ante, id elementum lacus est sit amet eros. Nulla facilisi. Ut ultrices, urna dictum mollis hendrerit, massa ipsum elementum eros, vel imperdiet leo nisl vitae tellus. In rutrum tortor elit. Sed ultricies elementum massa, nec sollicitudin risus vehicula ut. Aenean tincidunt ante tortor, sed dictum neque ornare vel."
        ],
        [
            "image": "6",
            "description": "Etiam non sapien non mi efficitur vestibulum. Morbi porta ultricies accumsan. Maecenas massa lacus, blandit a mauris volutpat, pulvinar malesuada arcu."
        ],
        [
            "image": "7",
            "description": "raesent sed lorem velit. Ut faucibus leo sapien, porta efficitur turpis placerat non. Nulla in massa tellus. Aliquam vitae magna ex. Curabitur vel nisl ac urna lobortis auctor. Aliquam erat volutpat. Maecenas blandit sodales neque, nec facilisis eros aliquam sit amet. Curabitur porta vitae massa id ultricies. Vivamus id enim vel mauris ornare viverra. "
        ],
        [
            "image": "8",
            "description": " Vivamus in quam tempor, dignissim purus sed, aliquet urna. Quisque enim risus, sollicitudin vel magna at, aliquet imperdiet enim. Quisque dictum suscipit tincidunt."
        ],
        [
            "image": "9",
            "description": "Etiam non sapien non mi efficitur vestibulum. Morbi porta ultricies accumsan. Maecenas massa lacus, blandit a mauris volutpat, pulvinar malesuada arcu. Vivamus orci libero, pulvinar vel posuere vel, placerat dignissim arcu. Duis luctus nulla at lorem condimentum luctus eget id nisl. Nullam eros metus, eleifend non semper vitae, iaculis non nunc. Donec semper dolor vel lorem feugiat dignissim. Duis fermentum egestas leo vitae volutpat. Vestibulum porttitor dui semper purus rhoncus pulvinar. Vestibulum fringilla augue sed facilisis viverra.Quisque pretium neque magna, suscipit vehicula felis fermentum sit amet. Fusce rutrum hendrerit mauris, id consequat massa interdum ac. Sed ligula nisl, finibus porttitor auctor sit amet, dapibus sed enim. Integer in sapien nec leo convallis luctus. Suspendisse consequat id urna at hendrerit. Etiam egestas nibh at tempus accumsan. Suspendisse sit amet est varius, condimentum est nec, varius sem. Vestibulum nisl ligula, auctor a accumsan lacinia, finibus a enim. Sed leo ligula, rutrum non sagittis vitae, tincidunt at arcu. Sed pellentesque ex sapien. Sed enim ligula, blandit eu libero sit amet, maximus pretium tellus. In euismod tortor at justo vulputate, sed sodales purus tincidunt. Suspendisse luctus sodales augue, mollis condimentum purus malesuada sit amet."
        ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        tblContent.delegate = self
        tblContent.dataSource = self
        tblContent.frame.size.height = tblContent.rowHeight
        //After Tableviews data source values are assigned
      
        
        tblContent.register(UINib(nibName: "myTableCell", bundle: nil), forCellReuseIdentifier: "cell")
        
      //  tblContent.translatesAutoresizingMaskIntoConstraints = false
        
       
    }


    @IBAction func BtnSelectedAction(_ sender: Any) {
    
        let randomInt = Int.random(in: 0..<9)
           let cellIndex = 0
           print(cellIndex)
           if let cell = tblContent.cellForRow(at: IndexPath(row: cellIndex, section: 0)) as? myTableCell {
               
            //   cell.myLabel.text = data[randomInt]["description"]
               cell.myTxtVw.text = data[randomInt]["description"]
           }
        myIMage.image = UIImage(named: data[randomInt]["image"]!)
        //After Tableviews data source values are assigned
        tblContent.reloadData()
//        tblContent.layoutIfNeeded()
//        tblContent.heightAnchor.constraint(equalToConstant: tblContent.contentSize.height).isActive = true
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblContent.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableCell
//        var frame = tableView.frame
//        frame.size.height = tableView.contentSize.height
//        tableView.frame = frame
        return cell
    }
    
}
